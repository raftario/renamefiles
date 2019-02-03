function Replace-SpaceCharacter
{
	[CmdletBinding()]
	param
	(
		[Parameter(ValueFromPipeline)]
		[ValidateNotNullOrEmpty()]
		[Alias('Text')]
		[System.String[]]$String
	)
	PROCESS
	{
		$Regex = "[/ ]+"
		FOREACH ($Str in $String)
		{
			Write-Verbose -Message "Original String: $Str"
			$Str -replace $Regex, "_"
		}
  }
}

function Remove-StringLatinCharacter
{
  [CmdletBinding()]
	param 
  (
		[Parameter(ValueFromPipeline)]
		[ValidateNotNullOrEmpty()]
		[Alias('Text')]
		[System.String[]]$String
	)
	PROCESS
	{
    FOREACH ($Str in $String)
    {
      Write-Verbose -Message "$Str"
      TRY
      {
        [Text.Encoding]::ASCII.GetString([Text.Encoding]::GetEncoding("Cyrillic").GetBytes($Str))
      } CATCH {
        Write-Error -Message $Error[0].exception.message
      }
    }
	}
}

function Remove-StringNonAsciiCharacter
{
	[CmdletBinding()]
	param
	(
		[Parameter(ValueFromPipeline)]
		[ValidateNotNullOrEmpty()]
		[Alias('Text')]
		[System.String[]]$String
	)
	PROCESS
	{
    $Regex = "[[^\x00-\x7F]+\ *(?:[^\x00-\x7F]| )*]+"
		FOREACH ($Str in $string)
		{
			Write-Verbose -Message "Original String: $Str"
			$Str -replace $Regex, ""
		}
  }
}

function Remove-StringSpecialCharacter
{
	[CmdletBinding()]
	param
	(
		[Parameter(ValueFromPipeline)]
		[ValidateNotNullOrEmpty()]
		[Alias('Text')]
		[System.String[]]$String
	)
	PROCESS
	{
		$Regex = "[^\p{L}\p{Nd}/./_/-]+"
		FOREACH ($Str in $String)
		{
			Write-Verbose -Message "Original String: $Str"
			$Str -replace $Regex, ""
		}
  }
}

Dir | Rename-Item -NewName {Replace-SpaceCharacter -String $_.name};
Dir | Rename-Item -NewName {Remove-StringLatinCharacter -String $_.name};
Dir | Rename-Item -NewName {Remove-StringNonAsciiCharacter -String $_.name};
Dir | Rename-Item -NewName {Remove-StringSpecialCharacter -String $_.name};
Write-Host "Done. Press any key to exit.";
cmd /c pause | out-null
