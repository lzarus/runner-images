Import-Module "$PSScriptRoot/../helpers/Common.Helpers.psm1"
Import-Module "$PSScriptRoot/../helpers/Tests.Helpers.psm1" -DisableNameChecking

$os = Get-OSVersion

Describe "Ruby" -Skip:($os.IsVentura -or $os.IsBigSur -or $os.IsMonterey -or $os.IsSonoma) {
    It "Ruby is available" {
        "ruby --version" | Should -ReturnZeroExitCode
    }

    It "Ruby is installed via HomeBrew" {
        Get-WhichTool "ruby" | Should -Not -BeLike "/usr/bin/ruby*"
    }

    It "Ruby tools are consistent" {
        $expectedPrefix = "/opt/homebrew"
        Get-WhichTool "ruby" | Should -Match "$($expectedPrefix)*"
        Get-WhichTool "gem" | Should -Match "$($expectedPrefix)*"
        Get-WhichTool "bundler" | Should -Match "$($expectedPrefix)*"
    }

    It "Ruby gems permissions are valid" {
        "gem install bundle" | Should -ReturnZeroExitCode
        "gem uninstall bundle" | Should -ReturnZeroExitCode
    }
}
