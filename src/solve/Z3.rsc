@license{
  Copyright (c) 2009-2015 CWI
  All rights reserved. This program and the accompanying materials
  are made available under the terms of the Eclipse Public License v1.0
  which accompanies this distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html
}
@doc{
	Synopsis: Wrapper around the Microsoft Z3 solver. Lets you execute SMT statements (as SMTLIBv2 AST commands) and returns the found answer (if any). 
}
@contributor{Jouke Stoel - stoel@cwi.nl (CWI)}

module \solve::Z3

import String;
import IO;
import util::SystemAPI;

import util::ShellExec;
import \solve::ThreadUtil;

@doc{
	Starts the Z3 solver.
	To run the solver the path to Z3 needs to be configure either by adding the -Dsolver.z3.path=<local.path.to.z3> to your eclipse.ini configuration or by supplying it 
	when you call the solver using the keyword parameter 'pathToZ3'
}
PID startZ3(str pathToZ3 = getSystemProperty("solver.z3.path")) { 
	pid = createProcess(pathToZ3 == "" ? "/usr/local/bin/z3" : "<pathToZ3>/bin/z3", args = ["-smt2", "-in"]);

	// The print-success option is needed so that each entered statement returns a result. This way we have a predictable inputstream that we can read
	run(pid, "(set-option :print-success true)"); 
	
	return pid;
}

void stopZ3(PID z3) { 
	writeTo(z3, "(exit)\n");
	killProcess(z3);
}

str \run(PID z3, str command, bool debug = false) {
	printIfDebug(command, debug);
		
	writeTo(z3, "<command>\n"); // the \n is added because the outcome of the command will otherwise not be flushed
	str outcome = read(z3);
	
	if (outcome != "") printIfDebug("Answer: <outcome>", debug);
	
	return outcome;	 
}


private str read(PID z3) {
	str output = "";
	// while the message is empty, keep reading till success or another output 
	while(output == "") {
		str out = readFrom(z3);
		
		while(out != "") {
			output += out;
			sleep(10);
			out = readFrom(z3);
		}
	}
	
	return trim(output) == "success" ? "" : replaceLast(output, "\n", "");
}

private void printIfDebug(str line, bool debug) {
	if (debug) {
		println(line);
	}
}
