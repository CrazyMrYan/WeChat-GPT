export const fetcher = async (url: any, config: RequestInit | undefined) => {    
    const data = await fetch('/pro_api' + url, {
        method: "GET",
        headers: {
            'Content-type': 'application/json',
        },
        ...config
    });
    
    return await data.json();
};