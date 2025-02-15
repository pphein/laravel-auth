import './bootstrap';

document.addEventListener("DOMContentLoaded", function() {
    const gridItems = document.querySelectorAll('.grid-item');
    gridItems.forEach(item => {
        const rowSpan = Math.ceil(item.querySelector('.card').getBoundingClientRect().height / 10);
        item.style.gridRowEnd = `span ${rowSpan}`;
    });
});