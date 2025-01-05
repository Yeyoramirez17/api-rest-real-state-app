<?php

namespace App\Mail;

use App\Entity\User;
use Symfony\Component\Mime\Email;
use Symfony\Component\Mime\Address;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;

class EmailService implements EmailServiceInterface
{
    private readonly MailerInterface $mailer;
    private readonly UrlGeneratorInterface $urlGenerator;

    public function __construct(MailerInterface $mailer, UrlGeneratorInterface $urlGenerator ) {
        $this->mailer = $mailer;
        $this->urlGenerator = $urlGenerator;
    }

    public function sendEmail( string $from, string $to, string $subject, string $body, array $options = [] ): bool
    {
        $email = (new Email)
            ->from( $from )
            ->to( $to )
            ->subject( $subject );


        try {
            $this->mailer->send( $email );
        } catch ( TransportExceptionInterface $ex ) {
            return false;
        }
        return true;
    }

    /**
     * @throws TransportExceptionInterface
     */
    public function sendEmailVerify(User $user ): bool
    {
        $url = $this->urlGenerator->generate(
            name: 'app_confirm_account',
            parameters: ['token' => $user->getConfirmation()->getToken() ],
            referenceType: UrlGeneratorInterface::ABSOLUTE_URL
        );

        $interval = $user->getConfirmation()->getCreatedAt()->diff( $user->getConfirmation()->getExpiration() );
        $minutes = $interval->h * 60 + $interval->i;
        $subject = "=?utf-8?B?" . base64_encode("Welcome \u{1F3E0} Please verify you account") . "?=";

        $email = (new TemplatedEmail)
            ->to( $user->getEmail() )
            ->htmlTemplate('email/email-verify.html.twig')
            ->subject( $subject )
            ->context([
                'name' => $user->getName(),
                'url' => $url,
                'expiration' => $minutes
            ]);

        $this->mailer->send( $email );

        return true;
    }
}
