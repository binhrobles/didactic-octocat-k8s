<img src="https://github.com/binhrobles/didactic-computing-machine/workflows/Redis%20Listener%20Dev/badge.svg">
<img src="https://github.com/binhrobles/didactic-computing-machine/workflows/Express%20Server%20Dev/badge.svg">
<img src="https://github.com/binhrobles/didactic-computing-machine/workflows/NGINX%20Dev/badge.svg">
<img src="https://github.com/binhrobles/didactic-computing-machine/workflows/React%20Client%20Dev/badge.svg">

<img src="https://github.com/binhrobles/didactic-computing-machine/workflows/Prod%20Deploy/badge.svg">

# didactic-computing-machine
Intentionally complicated React, Node, multi-container Docker project with Github Actions->EB

## Learnings
### Github Actions
- workflows run in parallel by default, and don't seem to have relationships
- jobs within a workflow have `needs` and `if` logic to create dependencies
- created separate test/build workflows per container for dev
  - had to condense them into a single workflow for prod
  - these containers would probably be in separate repos anyway
- Proper syntax for env/context variables: https://help.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions#contexts

### Docker Build-Push Action
- Remember to first check out the repo if using it in the job
- image didn't publish until it was explicitly tagged

## For next time
- Why not Terraform?
- Rollbacks?
- Separate CI from CD
