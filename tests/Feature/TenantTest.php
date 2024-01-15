<?php

use App\Models\User;

/* --------------------------------------------------------------------------------------------------
    Alguns detalhes importantes de serem considerados neste fluxo:

        - O banco de dados deverá funcionar tanto com os usuários no schema admin quanto com a
          tabela no schema do cliente;
        - Espera-se que o schema padrão seja "admin", possibilitando o uso da view de usuários
          gerais, tanto quanto a tabela de usuários dentro de algum schema de cliente;
        - A model de usuário possui um escopo global, garantindo que somente usuários ativos possam
          ser pesquisados.

   -------------------------------------------------------------------------------------------------- */

it('should login at correct database when correct email and password is used.', function () {
    $response = $this->post('/login', [
        'email' => 'user.test@client1.org',
        'password' => 'password'
    ]);

    expect($response->getStatusCode())->toBe(302)
        ->and(auth()->hasUser())->toBeTrue('Não conseguiu encontrar o usuário.');
});

todo('should use subdomain as company if it is passed');
todo('should not inform what is the wrong data when login fails');
todo('should not redirect to any company if login fails');
