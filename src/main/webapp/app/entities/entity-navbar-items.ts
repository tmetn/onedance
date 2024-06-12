import NavbarItem from 'app/layouts/navbar/navbar-item.model';

export const EntityNavbarItems: NavbarItem[] = [];

// Define your new entity
const newEntity: NavbarItem = {
  name: 'New Entity',
  route: '/new-entity-link',
  translationKey: 'New Entity Label',
};

// Add the new entity to the array
EntityNavbarItems.push(newEntity);
