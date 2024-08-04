
function experiment() {
    param (
        $n
    )
    $win_count = 0

    foreach ($i in 1..$n) {
        $prize = Get-Random -Maximum 3
        $choice = Get-Random -Maximum 3
        if ($choice -eq $prize) {
            $win_count++
        }
    }

    return $win_count
}

function experiment2() {
    param (
        $n
    )
    $win_count = 0

    foreach ($i in 1..$n) {
        $prize = Get-Random -Maximum 3
        $choice = Get-Random -Maximum 3

        if ($choice -eq $prize) {
            $possible = 0..2
        }
        else {
            $possible = $prize, $choice
        }

        $choice = $possible[$(Get-Random -Maximum $($possible.Length))]

        if ($choice -eq $prize) {
            $win_count++
        }
    }

    return $win_count
}

$count = 1000
$win_count = experiment($count)
Write-Output "experiment #1 probability: $($win_count * 100 / $count)"
$win_count2 = experiment2($count)
Write-Output "experiment #2 probability: $($win_count2 * 100 / $count)"
