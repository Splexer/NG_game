В этом проекте реализована базовая версия игры, с некоторыми продивинутыми изменениями, которые показались мне разумными или необходимыми. Некоторые спрайты предметов не соответсвуют их названию, например оливки имеют спрайт чеснока, для экономии времени. 
Чтобы не создавать систему сохранений, но при этом сохранять состояние уровней, была реализована система пула уровней, которая постоянно содержит в себе все когда-либо использовавшиеся уровни и изменения в них.
При необходимости сменить сцену, из пула загружается нужный уровень, а старый, удаляется из дерева сцены, но остаётся в пуле. 
