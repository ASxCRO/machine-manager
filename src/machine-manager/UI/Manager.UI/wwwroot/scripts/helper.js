function downloadFromByteArray(options) {
    const numArray = atob(options.byteArray).split('').map(c => c.charCodeAt(0));
    const uint8Array = new Uint8Array(numArray);
    const blob = new Blob([uint8Array], { type: options.contentType });
    const url = URL.createObjectURL(blob);
    downloadFromUrl({ url: url, fileName: options.fileName });
    URL.revokeObjectURL(url);
}


function downloadFromUrl(options) {
    const anchorElement = document.createElement('a');
    anchorElement.href = options.url;
    anchorElement.download = options.fileName ?? '';
    anchorElement.click();
    anchorElement.remove();
}