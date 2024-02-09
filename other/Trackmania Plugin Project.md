##### Thanks ChatGpt for letting me be lazy

# Trackmania Plugin Project

## Project Introduction

In the Trackmania community, there's a notable gap in the TOTD (Track of the Day) notifications: the inclusion of map style. For players heavily involved in the Cup of the Day (COTD), the style of the map significantly influences their participation. Although existing notification systems provide basic details like map name and author, they fall short by not specifying map style. My project seeks to address this by enhancing notifications with comprehensive details, including the style, which is pivotal for players with specific preferences.

## Objective

The project's goal is to develop a plugin that interfaces with a personal server to process and disseminate detailed notifications about TOTD maps, specifically including map style and author. This plugin will enable COTD players to submit gameplay data to the server. Subsequently, within 30 seconds of the COTD start, a notification will be sent through a Discord bot/API tool and to the plugin's users, providing insights into the map's style and author. By also analyzing map authors' typical styles, this system will cater to players' distinct interests, enhancing their gaming experience.

## Background

Initiated by "Ezio's" observation, there's a clear demand for more informative TOTD notifications, particularly regarding map styles. The community's reaction underscored a broad interest in such a feature, alongside the acknowledgment of challenges such as the manual effort needed for style identification and the absence of style data in Nadeo's API.

## Project Details

### Approach

This involves crafting a plugin that:
- Collects gameplay data from users and sends it to a personal server for analysis.
- Utilizes this server to infer map styles through a combination of algorithmic predictions and community input, as direct style data is unavailable from Nadeo's API.
- Sends enriched notifications including map name, author, and inferred style to users and a Discord bot/API tool, shortly after the COTD begins.

### Technical Aspects

The development will require integration with the Trackmania ecosystem, building a backend system for data processing and analysis on the personal server, and setting up a reliable notification delivery mechanism.

## Challenges and Considerations

- A primary challenge is the technical and logistical complexity of accurately determining map styles through indirect means, given the unavailability of this information from official sources.
- Encouraging community participation for data submission and ensuring the reliability of the style inference mechanism will be crucial.
- The project must also consider the dynamic nature of map styles and authors' tendencies, requiring constant updates and community engagement to maintain accuracy and relevance.

## Call to Action

Feedback, technical advice, and collaboration are sought from the community to enhance this project. Expertise in server-side development, data analysis, and API integrations would be particularly valuable. Contributions in any form, from development support to community outreach, will greatly aid in realizing this vision and are warmly welcomed.

## Closing

By bridging this information gap, this plugin aims to significantly enrich the COTD experience for the Trackmania community, offering personalized, style-specific notifications that directly influence player engagement. I'm excited to collaborate with the community on this innovative project, creating a more tailored and enjoyable gaming experience.
