process.env["INPUT_EGRESS-POLICY"] = "block";
process.env["INPUT_DNS-POLICY"] = "allowed-domains-only";
process.env["INPUT__LOG-DIRECTORY"] = "/tmp/gha-agent/logs";

process.env["INPUT_ALLOWED-DOMAINS"] = `
*.google.com
bing.com
*.github.com
`;

// uncomment to test with local agent or download release
process.env["INPUT__LOCAL-AGENT-PATH"] = "agent/agent";
// process.env["INPUT__AGENT-DOWNLOAD-BASE-URL"] =
// ("https://github.com/bullfrogsec/bullfrog/releases/download/");
