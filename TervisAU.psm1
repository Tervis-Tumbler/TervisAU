function Invoke-AUAppveyorBuild {
    param (
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]$Name,
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]$Version
    )
    begin {
        $PackageVersionStrings = @()
    }
    process {
        $PackageVersionStrings += "$Name$(if($Version){":$Version"})"
    }
    end {
        git commit -m "[AU $($PackageVersionStrings -join " ")]" --allow-empty
    }
}