# Define the registry path
$regPath = "HKLM:\SOFTWARE\WOW6432Node\PLESK\PSA Config\TaskManager"

# Get the current ACL (Access Control List)
$acl = Get-Acl -Path $regPath

# Define the new access rule for the "NT Service\PleskTaskManager" group
$rule = New-Object System.Security.AccessControl.RegistryAccessRule(
	"NT Service\PleskTaskManager",
	"FullControl",
	"ContainerInherit,ObjectInherit",
	"None",
	"Allow"
)

# Add the rule to the ACL
$acl.SetAccessRule($rule)

# Apply the updated ACL to the registry key
Set-Acl -Path $regPath -AclObject $acl

Write-Host "Full access permissions granted to NT Service\PleskTaskManager for $regPath"
