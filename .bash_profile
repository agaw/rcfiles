# Pull in any system defaults first so they can be overridden later
[ -r /etc/profile ] && source /etc/profile

# We run the environment settings for all shells to ensure it's always set up
source "${HOME}/.bash/environment"

# An interactive shell starting bash_profile must be a login shell (man bash)
# We run the login script and the interactive setup
if [ -n "${PS1}" ]; then
	source "${HOME}/.bash/login"
	source "${HOME}/.bash/interactive"
fi
