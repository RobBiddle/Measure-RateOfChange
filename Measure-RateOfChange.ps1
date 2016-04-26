function Measure-RateOfChange
{
<#
.NOTES
    Author: Robert D. Biddle (email: robertdbiddle+powershell@gmail.com )
.Synopsis
   Calculates rate of change between two values over time.
.DESCRIPTION
   Calculates rate of change between two values over time.
   Output is Rate of Change in v/t
.EXAMPLE
   Measure-RateOfChange -v1 6.87 -v2 12.58 -t1 35 -t2 36.7
#>
    [CmdletBinding()]
    [Alias()]
    [OutputType([Decimal])]
    Param
    (
        # v1 is the lower value
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]        
        [Decimal]$v1,
        # v2 is the upper value
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=1)]        
        [Decimal]$v2,
        # t1 is the lower time value
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=2)]
        [Decimal]$t1,
        # t2 is the upper time value
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=3)]
        [Decimal]$t2
    )
    Begin{}
    Process
    {
        if( (($v2 - $v1) -eq 0) -or (($t2 -$t1) -eq 0)) # Prevent Divide by Zero
        {
            $rateOfChange = 0
        }Else
        {        
            [Decimal]$rateOfChange = [Math]::Abs( ($v2 - $v1) / ($t2 - $t1) )
        }
        $rateOfChange
    }
    End{}
}