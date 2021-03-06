﻿<#
.Synopsis
   Retrieve data from the Guild Wars 2 API
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>
function Get-fromgw2api
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$false,
                   Position=0)]
        $endpoint,

        # Param2 help description
        [parameter(mandatory=$false,position=1)][string]
        $ids = $null
    )

    Begin
    {
    $baseapiurl = "https://api.guildwars2.com/v2/"
    switch ($endpoint)
        {
            "prices" {$suffix = "commerce/prices"}
            "listings" {$suffix = "commerce/listings"}
            "exchange" {$suffix = "commerce/exchange"}
            "items" {$suffix = "items"}
            "materials" {$suffix = "materials"}
            "recipes" {$suffix = "recipes"}
            "search-recipes" {$suffix = "recipes/search"}
            "skins" {$suffix = "skins"}
        }
    if ($ids -ne $null) {$parameter = "?ids=" + [system.string]::join(",",$ids)}
    if ($ids -eq $null) {$parameter = ""} 
    }
    Process
    {
    Invoke-RestMethod -Uri ($baseapiurl + $suffix + $parameter)
    }
    End
    {
    }
}