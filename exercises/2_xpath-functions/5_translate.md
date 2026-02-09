# Translate

translate(string, from, to)

translate() ersetzt jedes einzelne Zeichen aus from durch das Zeichen an der gleichen Position in to
Es findet nur ein Zeichen-Mapping statt (kein Suchen und Ersetzen von Wörtern!)

Beispiel:
translate('Hallo Welt', 'HW', 'hw')

Ergebnis: 'hallo welt'

Beispiel2:
Folgende Meldungen werden angezeigt:

- „Fehler beim Speichern“
- „FEHLER beim Speichern“
- „fehler beim Speichern“

//Text[contains(translate(@Name,'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'fehler')]
