# Contributing to FinTech Platform

Thank you for your interest in contributing!

## Development Workflow

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests (`npm test` or `pytest`)
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## Branch Naming Convention

- `feature/` - New features
- `bugfix/` - Bug fixes
- `hotfix/` - Urgent production fixes
- `docs/` - Documentation changes
- `refactor/` - Code refactoring

## Commit Message Format
```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- feat: New feature
- fix: Bug fix
- docs: Documentation
- style: Formatting
- refactor: Code restructuring
- test: Tests
- chore: Maintenance

**Example:**
```
feat(api-gateway): add rate limiting middleware

Implement rate limiting to prevent API abuse.
Configured at 100 requests per minute per IP.

Closes #123
```

## Code Style

### Python
- Follow PEP 8
- Use type hints
- Maximum line length: 100 characters
- Use Black for formatting
- Use isort for imports

### JavaScript/TypeScript
- Follow Airbnb style guide
- Use ESLint and Prettier
- Maximum line length: 100 characters

## Testing Requirements

- Unit test coverage minimum: 80%
- All tests must pass
- Add tests for new features
- Update tests for bug fixes

## Review Process

1. At least 1 approval required
2. All CI checks must pass
3. No merge conflicts
4. Branch protection rules enforced

## Questions?

Open an issue or reach out to the team.
