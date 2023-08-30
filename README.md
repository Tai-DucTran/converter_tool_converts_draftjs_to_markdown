# converter_converts_draftjs_to_markdown

A new Flutter project.

## Getting Started

This project addresses the issue that occurred with the 'draft_view' package, which is no longer maintainable or updatable.

Our company's project utilized the 'draft_view' package to display an article. However, we encountered an issue related to rendering unordered and ordered lists within sentences:

Issue:
    - If a sentence begins with a bullet point or ordered list number, and it also includes formatted text styles such as UNDERLINE, BOLD, or ITALIC, 'draft_view' renders it incorrectly. It treats them as normal sentences without adding any bullet points or ordered list numbers.

To solve this problem, I implemented a custom converter myself and also incorporated the 'markdown' package to assist in this process.

Please note:

    - The 'markdown' package does not yet support UNDERLINE formatting. In my implementation, I applied a workaround to convert UNDERLINE style to BOLD.
    - While this implementation still requires improvement and might not be the optimal solution, it successfully resolved our team's problem.