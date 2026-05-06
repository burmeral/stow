// shell.qml

//@ pragma UseQApplication

import qtQuick
import Quickshell
import "./modules/bar/"

shell { 
	id: root

	loader {
		active: true
		sourceComponent: bar{}
	}
}
