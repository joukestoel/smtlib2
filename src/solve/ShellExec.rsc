module \solve::ShellExec


@doc{
Synopsis: Start a new external process.
Description:
#  Start a new external process.
#  Start a new external process in a given working directory.
#  Start a new external process with the given arguments.
#  Start a new external process with the given arguments in the given working directory.
#  Start a new external process with the given environment variables.
#  Start a new external process with the given environment variables in the given working directory.
#  Start a new external process with the given arguments and environment variables.
#  Start a new external process with the given arguments and environment variables in the given working directory.

}
@javaClass{solve.ShellExec}
public java PID createProcess(str processCommand, loc workingDir=|cwd:///|, list[str] args = [], map[str,str] envVars = ());

@doc{
Synopsis: Kill a running process.
}
@javaClass{solve.ShellExec}
public java void killProcess(PID processId);

@doc{
Synopsis: Read from an existing process's output stream. This is non-blocking.
}
@javaClass{solve.ShellExec}
public java str readFrom(PID processId);

@doc{
Synopsis: Read from an existing process's error output stream. This is non-blocking.
}
@javaClass{solve.ShellExec}
public java str readFromErr(PID processId);

@doc{
Synopsis: Read the entire stream from an existing process's output stream. This is blocking.
}
@javaClass{solve.ShellExec}
public java str readEntireStream(PID processId);

@doc{
Synopsis: Read the entire error stream from an existing process's output stream. This is blocking.
}
@javaClass{solve.ShellExec}
public java str readEntireErrStream(PID processId);

@doc{
Synopsis: Write to an existing process's input stream.
}
@javaClass{solve.ShellExec}
public java void writeTo(PID processId, str msg);

@javaClass{solve.ShellExec}
public java void sleep(int ms);

@doc{
Synopsis: Process Identifiers (PID).

Description: Process IDentifiers (PIDs) are used to identify external processes.
A PID is returned by [createProcess] and is required for any further interaction with the created process.
}
public alias PID = int;

