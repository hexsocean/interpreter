declare function load(sources: string, env: {[key: string]: unknown}): LuaTuple<[Callback | undefined, string]>;
export = load;