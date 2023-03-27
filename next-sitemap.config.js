/** @type {import('next-sitemap').IConfig} */

const siteconfig = require("./site.config.js")

module.exports = {
  siteUrl: `https://${siteconfig.domain}`,
  generateRobotsTxt: true,
}