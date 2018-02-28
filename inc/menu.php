<div id="menu">
    <ul>
        <li><a href="produtos.php" <?php if($_GET['currentPage'] == 'produtos') echo 'class="active"'; ?>>Lista de Itens</a></li>
        <li><a href="incoming-purchases.php" <?php if($_GET['currentPage'] == 'incoming') echo 'class="active"'; ?>>Inserir Item</a></li>
        <li><a href="outgoing-order.php" <?php if($_GET['currentPage'] == 'outgoing') echo 'class="active"'; ?>>Remover Item</a></li>
        <li style="float: right;"><a href="logout.php">Sair</a></li>
        
    </ul>
</div>
