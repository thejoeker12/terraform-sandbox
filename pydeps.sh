jamftf_target_version=dev
jamfpy_target_version=dev

########
jamftf_url="https://github.com/deploymenttheory/jamftf-python-terraform-importer"
jamfpy_url="https://github.com/thejoeker12/jamfpy"

jamftf_pip_target="git+$jamftf_url@$jamftf_target_version"
jamfpy_pip_target="git+$jamfpy_url@$jamfpy_target_version"


# pip uninstall jamftf --no-input
# pip uninstall jamfpy --no-input

# JAMF TF
pip install --no-cache-dir --upgrade --force-reinstall $jamftf_pip_target

# JAMF PY
pip install --no-cache-dir --upgrade --force-reinstall $jamfpy_pip_target