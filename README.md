# MS-Exchange-2013-noagent
monitors MS exchange 2013 from a Windows monitoring station agentlessly through WMI using Powershell

this plugin is not part of "The Grid" yet. You can add it to your uptime environment by creating a custom extensions JSON (http://docs.uptimesoftware.com/display/KB/How+To+Install+Plugins+Without+Direct+Internet+Access) with the following entry.

[
{
    "category": "Applications - Email",
    "supported_versions": [
        "7.3","7.4","7.5"
    ],
    "name": "MS Exchange 2013 noagent",
    "git_file_target": "http://sql2012:8888/PluginRepo/MS-Exchange-2013-noagent.zip",
    "icon_url": "https://raw.githubusercontent.com/uptimesoftware/exchange2013-basic-monitor/d3ac708b4479313403e85384f0aa358ab3689702/img/icon.jpg",
    "upgrade_in_place": true,
    "requires_additional_setup": false,
    "requires_agent_scripts": false,
    "version": "1.0",
    "supported_platforms": [
        "windows"
    ],
    "grid_url_target": "http://the-grid.uptimesoftware.com/plugin/monitor-custom-remote.html",
    "type": "plugin",
    "description": "Pulls performance data from Exchange 2013 using powershell and WMI without an agent"
}
]
