# Contributing

## Before you contribute

### File an issue first!

If you see a bug or have an idea for a feature that you feel would improve the repo, **please
[file an issue](https://github.com/arteevraina/knowyourdonor/issues/new) before you begin
coding or send a PR**. This will help prevent duplicate work by letting us know
what you're up to. It will help avoid a situation in which you spend a lot of
time coding something that's not quite right for the repo or its goals.

## Issue Submission Guidelines

Before you submit your issue search the archive, maybe your question was already answered.

If your issue appears to be a bug, and hasn't been reported, open a new issue. Help us to maximize the effort we can spend fixing issues and adding new features, by not reporting duplicate issues.

The "new issue" form contains a number of prompts that you should fill out to make it easier to understand and categorize the issue.

**If you get help, help others. Good karma rulez!**

## Pull Request Submission Guidelines

Before you submit your pull request consider the following guidelines:

- First check whether there is an open Issue for what you will be working on. If there is not, open one up by going through issue submission guidelines.
- Search for an open or closed Pull Request that relates to your submission. You don't want to duplicate effort.
- Make your changes in a new git branch:

  ```text
    git checkout -b name-issue-tracker-short-description
  ```

  Name can be initials or GitHub username. An example of this could be:

  ```text
    git checkout -b arteevraina-issue-75-readme-typos master
  ```

## Git Commit Guidelines

Write meaningful commit messages.

### Commit Message Format

Each commit message consists of a mandatory **type** and **subject**. This is a specific format:

```shell
    <type>: <subject>
```

### Type

Must be one of the following:

- **`feat`**: A new feature
- **`fix`**: A bug fix
- **`docs`**: Documentation only changes
- **`style`**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **`refactor`**: A code change that neither fixes a bug nor adds a feature
- **`perf`**: A code change that improves performance
- **`test`**: Adding missing or correcting existing tests
- **`chore`**: Changes to the build process or auxiliary tools and libraries such as documentation generation
