module tests::ParserTester

import Parser;

import lang::smtlib25::Syntax;

import IO;
import ParseTree;
import util::Maybe;

bool parseAllExampleFilesAndCheckForAmbiguity() {
	loc exampleDir = |project://smtlib2/examples|;
	
	for (loc file <- exampleDir.ls) {
		try {
			Tree res = parseSmt2(file);
	
			if (just(_) := isAmbiguous(res)) {
				println("Ambiguity found in: <file>");
				return false;
			}
		} catch ex: {
			println("Somthing went wrong during parsing: <ex>");
			return false;
		}
	}
	
	return true;
}