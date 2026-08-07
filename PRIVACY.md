# Privacy Policy — copyflow

**Last updated:** August 2026

copyflow is a local-only clipboard manager. This document explains, plainly, what the app can access, what it does with it, and what it never does.

---

## 🔒 Short version

- Your clipboard history **never leaves your device**.
- copyflow has **no servers, no backend, no analytics, no accounts**.
- Nothing is uploaded, synced, or shared with the developer or anyone else.
- All clipboard data is stored **only in local app storage on your phone**, and is deleted if you uninstall the app or clear its data.

---

## 📋 What data copyflow accesses

| Data | Accessed? | Stored? | Sent anywhere? |
|---|---|---|---|
| Clipboard text you copy (in any app) | ✅ Yes | ✅ Locally only | ❌ Never |
| Screen content / accessibility events | ✅ Used transiently to detect copy actions | ❌ Not stored | ❌ Never |
| Personal identifiers (name, contacts, account info) | ❌ Never accessed | — | — |
| Location | ❌ Never accessed | — | — |
| Network activity | ❌ App makes no network requests | — | — |

---

## 🛠️ Why copyflow needs the permissions it asks for

Android restricts clipboard reading to apps that are currently in focus, for good reason — it prevents malicious apps from silently harvesting clipboard content (passwords, crypto addresses, OTPs, etc.) in the background. copyflow needs to work around this restriction to function as a clipboard manager, so it requests two sensitive-sounding permissions. Here's exactly what each one does and does **not** do:

### 1. Accessibility Service
**What it's used for:** Detecting *when* a copy action likely just happened somewhere on your device (a tap, a text selection change), so copyflow knows *when* to check the clipboard.

**What it does NOT do:**
- It does not read, log, or transmit the content of the screens you interact with.
- It does not record keystrokes.
- It does not read passwords, form fields, or any content unrelated to the clipboard.
- Accessibility events are processed transiently, in memory, and discarded immediately — none are stored or written to disk.

### 2. Display over other apps ("overlay" permission)
**What it's used for:** Briefly creating an invisible, 1-pixel, non-touchable window so the app can gain system focus for a fraction of a second — this is the only way Android permits an app to legally read the clipboard from the background. Nothing is drawn or shown to you; you will never see or interact with this window.

**What it does NOT do:**
- It cannot capture your screen.
- It cannot intercept your taps or gestures — the overlay is explicitly marked non-touchable.
- It is not used for ads, popups, or any visible UI.

---

## 💾 Where your data is stored

All captured clipboard text is stored **locally on your device only**, using standard local app storage. copyflow has no server component of any kind — there is nothing for your data to be sent *to*, even if the developer wanted to.

You can delete all stored history at any time by clearing the app's storage in Android Settings, or by uninstalling the app.

---

## 🧑‍💻 Open source, by design

copyflow's full source code is publicly available in this repository. Every claim made in this document can be independently verified by reading the code — nothing here is asked to be taken on trust alone.

---

## 📬 Questions

This is an open-source, independently developed project. If you have questions or concerns about privacy or data handling, please open an issue on the GitHub repository.
