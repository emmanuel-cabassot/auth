<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\User;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class AuthController extends AbstractController
{
    #[Route('/api/account', name: 'app_account', methods: ['POST'])]
    public function registerAccount(
        Request $request, 
        EntityManagerInterface $em,
        ValidatorInterface $validator
    ): JsonResponse {
        $data = json_decode($request->getContent(), true);
        
        if (!$data || !isset($data['login'], $data['password'])) {
            return new JsonResponse(['error' => 'Invalid data'], JsonResponse::HTTP_BAD_REQUEST);
        }

        if (!$this->isGranted('ROLE_ADMIN')) {
            return new JsonResponse(['error' => "Il est nécessaire de disposé d'un compte admin pour créer un compte"], JsonResponse::HTTP_FORBIDDEN);
        }

        $user = new User();
        $user->setLogin($data['login']);
        $user->setPassword(password_hash($data['password'], PASSWORD_BCRYPT));
        $user->setUuid(uniqid());
        $user->setCreatedAt(new \DateTimeImmutable());
        $user->setUpdatedAt(new \DateTimeImmutable());

        if (isset($data['status']) && $data['status'] === "closed") {
            $user->setStatus("closed");
        }

        $errors = $validator->validate($user);

        if (count($errors) > 0) {
            $errorMessages = [];
            foreach ($errors as $error) {
                $errorMessages[] = $error->getMessage();
            }
            return new JsonResponse(['errors' => $errorMessages], JsonResponse::HTTP_UNPROCESSABLE_ENTITY);
        }

        $em->persist($user);
        $em->flush();

        return new JsonResponse([
            'uid' => $user->getUserIdentifier(),
            'login' => $user->getLogin(),
            'roles' => $user->getRoles(),
            'createdAt' => $user->getCreatedAt()->format('Y-m-d H:i:s'),
            'updatedAt' => $user->getUpdatedAt()->format('Y-m-d H:i:s'),
        ], JsonResponse::HTTP_CREATED);
    }
}
