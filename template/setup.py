#! /usr/bin/env python3
"""A setuptools based setup module.

See:
https://packaging.python.org/guides/distributing-packages-using-setuptools/
https://github.com/pypa/sampleproject
"""

from setuptools import setup
import pathlib

here = pathlib.Path(__file__).parent.resolve()

setup(
    name='main',
    version='0.0.1',
    description='%HERE%',
    long_description=(here / 'README.md').read_text(encoding='utf-8'),
    long_description_content_type='text/markdown',
    url='https://github.com/Freed-Wu/sampleproject',
    author='%USER%',
    author_email='%MAIL%',
    maintainer='%USER%',
    maintainer_email='%MAIL%',
    classifiers=[
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'Topic :: Software Development :: Build Tools',
        'License :: OSI Approved :: GPL License',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: 3.9',
        "Programming Language :: Python :: 3.10",
        'Programming Language :: Python :: 3 :: Only',
    ],
    keywords='',
    package_dir={'': 'src'},
    py_modules=["main"],
    python_requires='>=3.6, <4',
    install_requires=[''],
    entry_points={
        'console_scripts': [
            'sample=sample:main',
        ],
    },
    project_urls={
        'Bug Reports': 'https://github.com/Freed-Wu//issues',
        'Source': 'https://github.com/Freed-Wu//',
    },
)
