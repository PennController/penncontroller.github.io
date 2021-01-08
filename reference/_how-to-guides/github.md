---
layout: how-to-guide
title: Syncing with a GitHub repository
parent: How-to guides
nav_exclude: true
---

You can import an entire GitHub repository to the PCIbex Farm. This is particularly useful if you would like to upload multiple files to an experiment project page's **Resources** folder, and do not want to upload each file one-by-one.

The GitHub repository must have one or more of the following folders in the root directory:

+ **data_includes**: Its contents will be copied into the **Scripts** folder.
+ **chunk_includes**: Its contents will be copied into the **Resources** folder.
+ **js_includes**: Its contents will be copied into the **Controllers** folder.

Example of an appropriate GitHub repository structure:

```
github-repository
├── README.md
├── data_includes
│   └── main.js
├── chunk_includes
│   ├── image1.png
│   └── image2.png
└── js_includes
    └── newController.js
```

Before uploading a GitHub repository, you should know that:

- No Git repository is hosted on the PCIbex Farm server. The specified repository is checked out, and its files are uploaded to your experiment. 

- **Caution!** Files with the same names will be replaced. Any file in a PCIbex experiment folder will be overwritten by a file with the same name in an uploaded GitHub repository. 

- Any file in a PCIbex experiment folder but not in an uploaded GitHub repository will not be affected.

- No files are ever copied to the **Results** folder, to ensure that results are never overwritten by accident.

- The repository checkout times out after 25 seconds. If this happens, just try again. If you are trying to check out a very large repository, you may have to reduce the size of the repository.

- Currently, it is only possible to upload a publicly readable Git repository.

  

To upload through Github:

1. Under **Experiment 'EXPERIMENT_NAME'**, click **Update from git repo >>**.
2. In the grey text input box, enter the following information:
   + In the "repo url" field, enter the URL of the GitHub repository that you are copying.
   + In the "branch/revision" field, enter the branch of the GitHub repository that you are copying.
3. Click **Sync**.
4. If the uploading was successful, the uploaded files will appear in the appropriate folder(s) and briefly flash red.


