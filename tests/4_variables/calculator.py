from PlatynUI.ui import Window, Button, Text, locator

@locator(name="Rechner")
class Calculator(Window):
    @property
    @locator(AutomationId="num5Button")
    def n5(self) -> Button: ...

    @property
    @locator(AutomationId="num6Button")
    def n6(self) -> Button: ...

    @property
    @locator(AutomationId="plusButton")
    def plus(self) -> Button: ...

    @property
    @locator(AutomationId="equalButton")
    def equal(self) -> Button: ...

    @property
    @locator(AutomationId="NormalOutput")
    def result(self) -> Text: ...


# Robot Framework calls get_variables() in variable files to fetch instances.
def get_variables():
    return {"calculator": Calculator()}