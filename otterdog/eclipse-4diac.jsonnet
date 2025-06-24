local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('iot.4diac', 'eclipse-4diac') {
  settings+: {
    description: "",
    name: "Eclipse 4diac™",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/4diac/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('4diac-documentation') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('4diac-examples') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('4diac-fbe') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "release",
      delete_branch_on_merge: false,
      has_discussions: true,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('4diac-forte') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "release",
      delete_branch_on_merge: false,
      description: "4diac FORTE is a small portable implementation of an IEC 61499 runtime environment targeting small embedded control devices, implemented in C++.",
      has_discussions: true,
      homepage: "https://eclipse.dev/4diac/4diac_forte/",
      web_commit_signoff_required: false,
      topics+: [
        "iec-61499",
        "plc",
        "real-time",
        "real-time-systems",
      ],
    },
    orgs.newRepo('4diac-fortebuildcontainer') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('4diac-ide') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "release",
      delete_branch_on_merge: false,
      has_discussions: true,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('4diac-toolchain') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "release",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('4diac-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('4diac-website-hugo') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}