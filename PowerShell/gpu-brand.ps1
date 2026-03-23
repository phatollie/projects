# Get GPU PCI Instance ID
# Justin Acevedo 3/23/2026

$gpu = Get-PnpDevice -Class Display | Select-Object -ExpandProperty InstanceId

# Extract the SUBSYS vendor ID (last 4 hex digits)
$subsys = ($gpu -split "SUBSYS_")[1].Substring(4,4).ToUpper()

# Vendor lookup table
$vendors = @{
    "1043" = "ASUS"
    "1462" = "MSI"
    "1458" = "Gigabyte"
    "3842" = "EVGA"
    "19DA" = "Sapphire"
    "1DA2" = "PowerColor"
    "174B" = "HIS"
    "1EAE" = "XFX"
    "17AA" = "Lenovo (OEM)"
    "1028" = "Dell (OEM)"
    "103C" = "HP (OEM)"
}

# Output result
if ($vendors.ContainsKey($subsys)) {
    "GPU Brand: $($vendors[$subsys])"
} else {
    "GPU Brand: Unknown (Vendor ID: $subsys)"
}
