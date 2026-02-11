# PlatynUI Keyword Cheat Sheet (Robot Framework)

This cheat sheet summarizes the keywords exported by **PlatynUI v0.9.2** and shows how to use them in Robot Framework.

---

## Getting started

### Import the library

```robot
*** Settings ***
Library    PlatynUI
```

### Elements and locators

Most keywords take an **element descriptor** (e.g., `ElementDescriptor` / `RootElementDescriptor`). In tests you typically reference elements via variables (often from a variables/module “page object”).

Example structure:

```robot
*** Settings ***
Library      PlatynUI
Variables    calculator.py

*** Test Cases ***
Addition
    Activate    ${calculator.n5}
    Activate    ${calculator.plus}
    Activate    ${calculator.n6}
    Activate    ${calculator.equal}
    Get Text    ${calculator.result}    should be    11
```

---

## Inline assertions (common pattern)

Several “getter” keywords accept optional assertion arguments:

- `assertion_operator`
- `assertion_expected`
- `assertion_message`

Supported operators (selection):

- `==` / `should be`
- `!=` / `should not be`
- `contains` / `not contains`
- `should start with` / `should end with`
- `matches`
- `validate`
- `then` / `evaluate`

Supported formatters inside assertion operator strings:

- `normalize spaces`
- `strip`
- `case insensitive`
- `apply to expected`

Example:

```robot
${txt}=    Get Text    ${statusbar.message}    contains    Ready
# ${txt} is still returned; the assertion is evaluated by the keyword.
```

---

## Keywords (all)

### Application / context

#### `Set Root Element    element: RootElementDescriptor`

Sets the root context used for subsequent element resolution.

```robot
Set Root Element    ${MyApp.MainWindow}
```

---

### Waiting / existence

#### `Ensure Exists    descriptor    timeout=None    raise_exception=True  -> bool`

Waits until an element exists (up to `timeout`). Returns a boolean. If `raise_exception=True`, the keyword fails if the element doesn’t appear.

```robot
${ok}=    Ensure Exists    ${dlg.error}    timeout=5s    raise_exception=False
Should Be True    ${ok}
```

---

### Activation / state

#### `Activate    descriptor: ElementDescriptor[Activatable]`

Invokes/activates the control (press/click/invoke depending on control type).

```robot
Activate    ${toolbar.save}
```

#### `Deactivate    descriptor: ElementDescriptor[Deactivatable]`

Deactivates a control (commonly toggles/switch-like controls).

```robot
Deactivate    ${settings.dark_mode_toggle}
```

#### `Is Active    descriptor    assertion_operator=None ...  -> bool`

Reads whether an element is “active” and optionally asserts inline.

```robot
${active}=    Is Active    ${settings.dark_mode_toggle}    should be    True
```

---

### Text

#### `Set Text    descriptor: ElementDescriptor[EditableText]    text: str`

Sets the text into an editable control.

```robot
Set Text    ${login.username}    alice
```

#### `Get Text    descriptor: ElementDescriptor[Text]    assertion_operator=None ...  -> str`

Gets the text/value from an element and optionally asserts inline.

```robot
${value}=    Get Text    ${statusbar.message}    contains    Ready
```

---

### Properties (generic UI metadata)

PlatynUI defines common property names such as: `BoundingRectangle`, `Enabled`, `Visible`.

#### `Get Property Names    descriptor: ElementDescriptor[Properties]    assertion_operator=None ...  -> list[str]`

Returns available property names for the element; can assert against the returned list.

```robot
@{names}=    Get Property Names    ${some.control}    contains    Enabled
```

#### `Get Property Value    descriptor: ElementDescriptor[Properties]    name: PropertyName|str    assertion_operator=None ...  -> any`

Returns a specific property value and optionally asserts inline.

```robot
${enabled}=    Get Property Value    ${btn.ok}    Enabled    should be    True
${rect}=       Get Property Value    ${btn.ok}    BoundingRectangle
```

---

### Mouse

Mouse buttons supported: `left`, `middle`, `right`, `x1`, `x2`.

> Note: `x`/`y` semantics (absolute vs element-relative) depend on the implementation. For the workshop, have participants verify behavior with a small experiment for your target platform/app.

#### `Mouse Move To    descriptor=None    x=None    y=None`

Moves the mouse to an element and/or coordinates.

```robot
Mouse Move To    ${canvas}    x=10    y=10
```

#### `Mouse Click    descriptor=None    x=None    y=None    button=None    times=1  -> Point`

Clicks and returns a `Point` (mouse position).

```robot
${pt}=    Mouse Click    ${list.item_1}    button=left
Mouse Click    ${list.item_1}    times=2
```

#### `Mouse Double Click    descriptor=None    x=None    y=None    button=None`

Double-clicks.

```robot
Mouse Double Click    ${file}    button=left
```

#### `Mouse Press    descriptor=None    x=None    y=None    button=None`

Mouse button down.

```robot
Mouse Press    ${slider.thumb}    button=left
```

#### `Mouse Release    descriptor=None    x=None    y=None    button=None`

Mouse button up.

```robot
Mouse Release    ${slider.thumb}    button=left
```

#### `Mouse Position    assertion_operator=None ...  -> Point`

Returns the current mouse `Point`, optionally asserts inline.

```robot
${pos}=    Mouse Position
```

---

### Keyboard

All keyboard keywords take `descriptor: ElementDescriptor[HasKeyboard]`, varargs `*keys`, and optional `delay`.

#### `Type Keys    descriptor    *keys    delay=None`

Types keys (press+release sequences).

```robot
Type Keys    ${editor}    Hello    ${SPACE}    world!    delay=0.05
```

#### `Press Keys    descriptor    *keys    delay=None`

Presses keys down (useful for chords/modifiers).

```robot
Press Keys    ${editor}    CTRL    A
```

#### `Release Keys    descriptor    *keys    delay=None`

Releases previously pressed keys.

```robot
Release Keys    ${editor}    CTRL
```

---

## Quick recipes

### Verify UI state using inline assertions

```robot
Get Text              ${status.label}    should start with    Ready
Get Property Value    ${btn.ok}          Enabled             should be    True
Is Active             ${toggle}          should be           False
```

### Robust existence check without failing immediately

```robot
${exists}=    Ensure Exists    ${dialog.error}    timeout=2s    raise_exception=False
Run Keyword If    ${exists}    Get Text    ${dialog.error_message}    contains    Invalid
```
