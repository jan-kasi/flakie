{ lib, fetchPypi, fetchgit, buildPythonPackage, buildPythonApplication
, accelerate, chromadb, ctransformers, deepmerge, InstructorEmbedding, langchain
, pydantic, pyyaml, quart, sentence-transformers, tqdm, transformers, typer
, typing-extensions, extract-msg, pandoc, pypandoc, pdfminer, unstructured
, argilla }:
let
  pname = "chatdocs";
  version = "0.2.6";
in buildPythonApplication {
  inherit pname version;
  src = fetchPypi { sha256 = lib.fakeSha256; };

  # doCheck = false;

  propogatedBuildInputs = [
    # specify dependencies
    accelerate
    chromadb
    ctransformers
    deepmerge
    InstructorEmbedding
    langchain
    pydantic
    pyyaml
    quart
    sentence-transformers
    tqdm
    transformers
    typer
    typing-extensions
    # document loaders
    extract-msg
    pandoc
    pypandoc
    pdfminer
    unstructured
    #temporary fix for 'rich', 'numpy' version conflicts.
    argilla
  ];

  meta = with lib; {
    homepage = "https://github.com/marella/chatdocs";
    description = "Chat with your documents offline using AI";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
