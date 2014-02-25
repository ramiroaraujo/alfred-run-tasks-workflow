on run revealpath
	if application "Path Finder" is running then
		tell application "Path Finder"
			reveal revealpath
			activate
		end tell
	else
		tell application "Finder"
			reveal POSIX file revealpath as text
			activate
		end tell
	end if
end run