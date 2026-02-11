# xpath cheat sheet

**contains:**
Element[contains(@Property, "Value")]

**starts-with:**
Element[starts-with(@Property, "Value")]

**normalize-space:**
Element[normalize-space(@Property)="Value")]

**not:**
Element[not(contains(@Property, "(Value)"))]

**translate:**
Element[contains(translate(@Property,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'Value')]

Examples:

- Element: Edit, Button, Window, …
- Property: Name, AutomationId, …
- Value: 11, ok, true
