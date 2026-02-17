<?php
echo "PHP Version: " . PHP_VERSION . "\n";
echo "OCI8 Extension: " . (extension_loaded('oci8') ? "Loaded ✓" : "NOT loaded ✗") . "\n";

if (extension_loaded('oci8')) {
    echo "OCI8 Version: " . oci_client_version() . "\n";
}
