# my-toggl-tasks
A simple way to plot what you logged in [toggl](https://toggl.com/) the last 30 days

## Requirements

[R](https://www.r-project.org/) is used to process the data.
The script `get-my-tasks.sh` to fetch the data needs to be in the path.

### Environment Variables

To work 3 toggl related variables are needed

- TOGGL_TOKEN is for your API token to access toggl
- TOGGL_WORKSPACE is the workspace in toggl that you are interested in
- TOGGL_USER_ID is the the toggl id of interest

## Usage

`my-tasks.sh` uses `get-my-tasks.sh` to fetch data from toggl and triggers an R script to produce a simple `tasks.png`

## References

- [toggl API](https://github.com/toggl/toggl_api_docs)



