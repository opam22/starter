<?php

require 'vendor/autoload.php';


$pages = 'index';
if (isset($_GET['p'])) {
    $pages = $_GET['p'];
}


$loader = new Twig_Loader_Filesystem('views');
$twig = new Twig_Environment($loader);


switch ($pages) {
    case 'index':
        echo $twig->render('main.twig');
        break;
    case 'dashboard':
        echo $twig->render('content/main_page.twig');
        break;
    case 'register':
        echo $twig->render('register.twig');
        break;
    case 'createQ':
        echo $twig->render('workspace/create_question.twig');
        break;
    default:
        header('HTTP/1.0 404 Not Found');
        echo 'Page Not Found 404';
        break;
}
