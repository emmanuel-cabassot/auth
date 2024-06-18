<?php

namespace App\EventListener;

use Lexik\Bundle\JWTAuthenticationBundle\Event\JWTCreatedEvent;
use Symfony\Component\Security\Core\User\UserInterface;

class JWTCreatedListener
{
    public function onJWTCreated(JWTCreatedEvent $event)
    {
        $user = $event->getUser();
        if (!$user instanceof UserInterface) {
            return;
        }

        $payload = $event->getData();
        // Remove the 'username' field if necessary
        unset($payload['username']);
        // Add the 'uuid' field
        $payload['uuid'] = $user->getUserIdentifier();

        $event->setData($payload);
    }
}