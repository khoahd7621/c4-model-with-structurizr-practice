### C4 Model for Book Store System with Structurizr

A simple C4 Diagram as Code for Book Store System that use Structurizr DSL with Visual Studio Code for visualization diagrams

You can use `Struturizr` plugin in `VSCode` and `structurizr/lite` docker image to run this sample by following these steps

1. Install and run Docker

1. Clone this repo

1. Using your favourite CLI, cd to root folder of project, copy the URL where the project took place and run the command `docker run -it --rm -p 8080:8080 -v [Your project URL]:/usr/local/structurizr --env-file .env.sample structurizr/lite`

The set contains these diagrams

- Level 1 – Context Diagram for Books Store System
- Level 2 – Container Diagram for Books Store System
- Level 3 – Component Diagram for Admin Web API
- Deployment Diagram – Microservices Deployment ‘Books Store System’ On AWS (Implementing)
- Simple Dynamic Diagram – Workflow CI/CD for deploying ‘Books Store System’ using AWS services (Implementing)

### Requirements

- [C4Model_Assigment_2023](https://docs.google.com/document/d/1ONoxFcvuznQz_WhtLQ3mjQcc02FRCcuP/edit?usp=sharing&ouid=114922537736271516598&rtpof=true&sd=true)

### Reference

- [Structurizr - language-reference](https://github.com/structurizr/dsl/blob/master/docs/language-reference.md)
- [c4-as-code-sample](https://github.com/luantien/c4-as-code-sample)
