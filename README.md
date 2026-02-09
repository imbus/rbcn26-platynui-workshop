# Robocon 2026 – PlatynUI Workshop

Welcome to this practical session introducing **robotframework-platynui**, a cross-platform UI testing library for desktop applications.

## Introduction

This practical session introduces **robotframework-platynui**, a cross-platform UI testing library for desktop applications. You'll learn to set up your environment, use the PlatynUI Spy tool, create effective locators, and build your own test cases. Advanced topics include structuring test suites, remote test execution, and solving common automation challenges.

## Setup & Installation

Please choose one of the following setups for the workshop.

### Option A: Windows (Preferred)

The best experience is on a local **Windows 10 or 11** machine (or VM). PlatynUI has the most comprehensive feature set on Windows.

- [Installation Guide for Windows](docs/WINDOWS_GUIDE.md)

### Option B: Windows ARM VM (for MacOS Users)

If you are using a **MacOS host** machine, PlatynUI can be run on a **Windows 11 ARM VM**. We used UTM for virtualization. For detailed setup refer to the installation guide below:

- [Installation Guide Windows ARM on MacOS](docs/ARM_WINDOWS_GUIDE.md)

### Option C: Linux (Alternative)

You can use a local **Linux** machine (or VM), such as Fedora.
> **Important:** You must use an **X11** session. Wayland is not fully supported for automation.

- [Installation Guide for Linux](docs/LINUX_GUIDE.md)

### Option D: Devcontainer (Fallback)

If you cannot install software locally or run a VM, use the **Devcontainer**.
> **Note:** This is a fallback solution with limitations in compatibility and performance.

- [Devcontainer Guide](docs/DEVCONTAINER_GUIDE.md)

## Workshop Description

### Topics Covered

- **PlatynUI architecture** and key advantages
- **Installation**, integration, and environment setup
- **Using PlatynUI Spy** and writing strong locators
- **Test suite design** and maintenance

### Target Audience

QA engineers, automation testers, and developers familiar with Robot Framework and Python, looking to expand into desktop UI testing.

### Planned Exercises

1. **Set up and configure PlatynUI** in your testing environment.
2. **Use PlatynUI Spy** to inspect elements and understand the object tree.
3. **Create reliable locators** using different strategies.
4. **Build stable desktop UI tests** for a sample application.
5. **Apply best practices** for maintainable test automation.

By the end of this workshop, you will be able to apply reliable locator strategies and troubleshoot common issues in desktop UI automation.
