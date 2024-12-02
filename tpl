ARQUIVO composer.json
{
    "require": {
        // A BIBLIOTECA RAINTPL É UM MOTOR DE TEMPLATE PARA PHP, USADO PARA SEPARAR A LÓGICA DA APLICAÇÃO DO HTML.
        "rain/raintpl": ">=3.0.0",
        
        // A BIBLIOTECA PHPMAILER É UTILIZADA PARA ENVIO DE EMAILS DE FORMA SIMPLES E EFICIENTE EM PHP.
        "phpmailer/phpmailer": "~5.2"
    }
}





arquivo index.

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




