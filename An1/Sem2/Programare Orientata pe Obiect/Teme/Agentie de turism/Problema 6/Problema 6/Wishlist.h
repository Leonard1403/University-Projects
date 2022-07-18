#pragma once
#include "Turism.h"
#include <vector>
#include <algorithm>
#include <random>
#include <chrono>

using std::vector;

class Wishlist {
private:
	vector<Turism> wishlist;
public:
	Wishlist() = default;

	//adauga o oferta de turism
	void adauga_wishlist(const Turism& a);

	//goleste wishlist
	void goleste_wishlist();

	//adauga random agentii de turism
	void adauga_random(vector<Turism> allTuristi, int n);

	//vector cu toate agentiile de turism
	const vector<Turism>& get_all_from_wishlist();

	void valideaza_turism(const Turism& a);
};

void teste_wishlist();