ARQUIVO composer.json
{
    "require": {
        // A BIBLIOTECA RAINTPL É UM MOTOR DE TEMPLATE PARA PHP, USADO PARA SEPARAR A LÓGICA DA APLICAÇÃO DO HTML.
        "rain/raintpl": ">=3.0.0",
        
        // A BIBLIOTECA PHPMAILER É UTILIZADA PARA ENVIO DE EMAILS DE FORMA SIMPLES E EFICIENTE EM PHP.
        "phpmailer/phpmailer": "~5.2"
    }
}







arquivo index.php

<?php

// IMPORTA O AUTOLOAD DO COMPOSER PARA GERENCIAR AS DEPENDÊNCIAS DO PROJETO.
require_once("vendor/autoload.php");

// IMPORTA A CLASSE PRINCIPAL DO RAINTPL.
use Rain\Tpl;

// CONFIGURAÇÃO DO RAINTPL
$config = array(
    "tpl_dir"       => "tpl/",   // DIRETÓRIO ONDE OS ARQUIVOS DE TEMPLATE (.html) ESTÃO LOCALIZADOS.
    "cache_dir"     => "cache/" // DIRETÓRIO PARA ARMAZENAR ARQUIVOS CACHEADOS DOS TEMPLATES.
);
Tpl::configure($config); // CONFIGURA O RAINTPL COM OS DIRETÓRIOS ESPECIFICADOS.

// CRIA UMA NOVA INSTÂNCIA DO OBJETO TPL (RAINTPL).
$tpl = new Tpl;

// ATRIBUI UMA VARIÁVEL AO TEMPLATE. ESSA VARIÁVEL PODE SER USADA NO ARQUIVO TEMPLATE (.html).
$tpl->assign("name", "Hcode"); // O VALOR "Hcode" SERÁ USADO NO LUGAR DA VARIÁVEL {name}.
$tpl->assign("version", PHP_VERSION); // ATRIBUI A VERSÃO DO PHP NA VARIÁVEL {version}.

// RENDERIZA O TEMPLATE CHAMADO "index" (LOCALIZADO NO DIRETÓRIO tpl/).
$tpl->draw("index"); // GERA E EXIBE O CONTEÚDO DO TEMPLATE NA TELA.

?>




arquivo index.html
<h1>Hello {$name}</h1>

<p>Teste de template</p>
<p>Versão do PHP: {$version}</p>













arquivo email.php
<?php

// INCLUI O ARQUIVO DE AUTOLOAD DO COMPOSER
require_once("vendor/autoload.php");

// USA A CLASSE Tpl DO PACOTE Rain
use Rain\Tpl;

// CONFIGURAÇÕES DO TEMPLATE ENGINE
$config = array(
    "tpl_dir"       => "tpl/", // DIRETÓRIO DOS TEMPLATES
    "cache_dir"     => "cache/" // DIRETÓRIO DO CACHE
);
Tpl::configure($config);

// INSTANCIA UM OBJETO DA CLASSE Tpl
$tpl = new Tpl;

// ATRIBUI UMA VARIÁVEL AO TEMPLATE
$tpl->assign("name", "Hcode");
$tpl->assign("version", PHP_VERSION);

// DESENHA O TEMPLATE E ARMAZENA O HTML EM UMA VARIÁVEL
$html = $tpl->draw("index", true);

// CRIA UMA NOVA INSTÂNCIA DA CLASSE PHPMailer
$mail = new PHPMailer;

// CONFIGURA O USO DE SMTP
$mail->isSMTP();

// ATIVA O DEBUG PARA SMTP
// 0 = DESATIVADO (PRODUÇÃO)
// 1 = MENSAGENS DO CLIENTE
// 2 = MENSAGENS DO CLIENTE E DO SERVIDOR
$mail->SMTPDebug = 2;

// DEFINE O FORMATO DO DEBUG PARA HTML
$mail->Debugoutput = 'html';

// DEFINE O HOSTNAME DO SERVIDOR SMTP
$mail->Host = 'smtp.gmail.com';
// CASO SUA REDE NÃO SUPORTE SMTP SOBRE IPV6, USE:
// $mail->Host = gethostbyname('smtp.gmail.com');

// DEFINE O NÚMERO DA PORTA SMTP - 587 PARA TLS AUTENTICADO
$mail->Port = 587;

// DEFINE O TIPO DE ENCRIPTAÇÃO USADO - ssl (OBSOLETO) OU tls
$mail->SMTPSecure = 'tls';

// DEFINE SE O SMTP REQUER AUTENTICAÇÃO
$mail->SMTPAuth = true;

// DEFINE O NOME DE USUÁRIO PARA AUTENTICAÇÃO SMTP
// USE O ENDEREÇO COMPLETO DO GMAIL
$mail->Username = "@gmail.com";

// DEFINE A SENHA PARA AUTENTICAÇÃO SMTP
$mail->Password = "";

// DEFINE QUEM ENVIA A MENSAGEM
$mail->setFrom('@gmail.com', 'Curso PHP 7');

// DEFINE QUEM RECEBERÁ A MENSAGEM
$mail->addAddress('@gmail.com', '');

// DEFINE O ASSUNTO DO EMAIL
$mail->Subject = 'Testando a classe PHPMailer com Gmail';

// DEFINE O CORPO DA MENSAGEM EM HTML
$mail->msgHTML($html);

// DEFINE UMA ALTERNATIVA DE TEXTO SIMPLES PARA O CORPO DA MENSAGEM
$mail->AltBody = 'This is a plain-text message body';

// ANEXA UM ARQUIVO DE IMAGEM
$mail->addAttachment('images/phpmailer_mini.png');

// ENVIA A MENSAGEM E VERIFICA SE HOUVE ERROS
if (!$mail->send()) {
    echo "Mailer Error: " . $mail->ErrorInfo; // EXIBE O ERRO, CASO OCORRA
} else {
    echo "Message sent!"; // CONFIRMA QUE A MENSAGEM FOI ENVIADA
}

?>


