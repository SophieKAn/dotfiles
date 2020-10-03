from setuptools import setup

setup(
    name="dotfiles",
    version="0.0.1",
    py_modules=["dotfiles"],
    install_requires=["click"],
    dev_requires=["black"],
    python_requires=">=3.8",
    entry_points="""
        [console_scripts]
        dotfiles=dotfiles:main
    """,
)
