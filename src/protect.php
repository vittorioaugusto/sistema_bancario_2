<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <?php

    if (!isset($_SESSION)) {
        session_start();
    }

    if (!isset($_SESSION['id'])) {
        die("<div class='tela_protect'>
                <div class='informacoes_protect'>
                    <h2>Você não pode acessar esta página porque não está logado.</h2><br>
                    <div class='botao_protect'>
                        <p><a href=\"index.php\"><button class='butao'>Fazer o Login!</button></a></p>
                    </div>
                </div>
            </div>
			
           "
        
        );
    }

    ?>


</body>

</html>