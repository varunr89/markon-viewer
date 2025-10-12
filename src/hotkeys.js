import { HOTKEYS } from './settings.js'
import { $ } from './utils.js'

// Key event handler
export const createKeyHandler = settingsDialog => e => {
	if (e.target.matches('input, textarea, [contenteditable]') || e.altKey || e.shiftKey || e.ctrlKey || e.metaKey) return

	const key = e.key.toLowerCase()

	// Special keys
	switch (key) {
		case '?':
			if (e.shiftKey) {
				e.preventDefault()
				settingsDialog.show()
			}
			return
	}

	// Regular hotkeys
	const hotkey = HOTKEYS.find(([k]) => k === key)
	if (hotkey) {
		e.preventDefault()
		const [, , targetId] = hotkey
		
		// Special handling for toggle-preview
		if (targetId === 'toggle-preview' && window.previewManager) {
			window.previewManager.toggle()
			return
		}
		
		$(targetId)?.click()
	}
}

// Setup hotkeys
export const setupHotkeys = settingsDialog => {
	document.addEventListener('keydown', createKeyHandler(settingsDialog))
}
