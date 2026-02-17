/**
 * TSNode Logger
 *
 * Provides:
 * - Colored output in terminal
 * - Timestamps
 * - Object inspection for complex data
 *
 * Available global functions (always available):
 *  - `infoLog(...args)`  → logs informational messages
 *  - `warnLog(...args)`  → logs warning messages
 *  - `errorLog(...args)` → logs error messages
 *
 * Optional:
 * You can override console.log / console.warn / console.error
 * by uncommenting the corresponding lines below.
 *
 * Example Usage:
 * ```ts
 * import "./logger";
 *
 * infoLog("Server started on port", 3000);
 * warnLog("Cache miss for key", key);
 * errorLog("Failed to connect to database", err);
 *
 * // Optional override:
 * // console.log("This will now use the custom formatter");
 * ```
 */

/*
 * ===============================================================================
 */

// import util from "node:util";

// declare global {
// 	var infoLog: (...args: any[]) => void;
// 	var warnLog: (...args: any[]) => void;
// 	var errorLog: (...args: any[]) => void;
// }

// const RESET = "\x1b[0m";
// const COLORS = {
// 	info: "\x1b[38;5;217m",
// 	warn: "\x1b[38;5;227m",
// 	error: "\x1b[1;31m",
// };

// function format(level: string, color: string, args: any[]): string {
// 	const timestamp = new Date().toISOString();
// 	const message = args
// 		.map((a) => (typeof a === "string" ? a : util.inspect(a, { depth: 5, colors: false })))
// 		.join(" ");
// 	return `[${color}${level}${RESET}] [${timestamp}] ${message}`;
// }

// globalThis.infoLog = (...args: any[]) => {
// 	process.stdout.write(format("INFO", COLORS.info, args) + "\n");
// };

// globalThis.warnLog = (...args: any[]) => {
// 	process.stdout.write(format("WARN", COLORS.warn, args) + "\n");
// };

// globalThis.errorLog = (...args: any[]) => {
// 	process.stderr.write(format("ERROR", COLORS.error, args) + "\n");
// };

/*
 * Optional: Uncomment the following lines to override the console object
 * Note: Do this only if you want every console.log/warn/error to use this logger.
 * ==============================================================================
 */

// console.log = (...args: any[]) => process.stdout.write(format("INFO", COLORS.info, args) + "\n");
// console.warn = (...args: any[]) => process.stdout.write(format("WARN", COLORS.warn, args) + "\n");
// console.error = (...args: any[]) => process.stderr.write(format("ERROR", COLORS.error, args) + "\n");

/**
 * ==============================================================================
 */

// export {};
